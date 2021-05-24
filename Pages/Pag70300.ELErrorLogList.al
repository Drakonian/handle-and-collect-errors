page 70300 "EL Error Log List"
{

    ApplicationArea = All;
    Caption = 'Error Log List';
    PageType = List;
    SourceTable = "EL Error Log";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                }
                field("Error Text"; Rec."Error Text")
                {
                    ToolTip = 'Specifies the value of the Error Text field';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ELSimulateErrors)
            {
                ApplicationArea = All;
                Image = Start;
                Caption = 'Simulate Errors';
                ToolTip = 'Simulate Errors';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    SimulateErrors();
                end;
            }
            action(ELShowErrorMessage)
            {
                ApplicationArea = All;
                Image = ErrorLog;
                Caption = 'Show Error Message';
                ToolTip = 'Show Error Message';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    Rec.ShowErrorMessage();
                end;
            }
            action(ELShowErrorCallstack)
            {
                ApplicationArea = All;
                Image = BreakRulesOn;
                Caption = 'Show Error Callstack';
                ToolTip = 'Show Error Callstack';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    Rec.ShowErrorCallstack();
                end;
            }
        }
    }

    local procedure SimulateErrors()
    var
        RunProcess: Codeunit "EL Run Process";
        HasError: Boolean;
        i: Integer;
    begin
        for i := 1 to 30 do begin
            ClearLastError();
            RunProcess.SetParams(GetOneOrTwo());
            //50% chance to insert record without error
            HasError := not RunProcess.Run();
            if HasError then
                InsertErrorLog();
            Commit();
        end;
    end;

    local procedure GetOneOrTwo(): Integer
    begin
        Randomize(Time - 000000T);
        exit(Random(2));
    end;

    local procedure InsertErrorLog()
    var
        ErrorLog: Record "EL Error Log";
        OutStreamVar: OutStream;
    begin
        ErrorLog.Init();
        ErrorLog."Error Text" := CopyStr(GetLastErrorText(), 1, MaxStrLen(ErrorLog."Error Text"));
        ErrorLog."Error Message".CreateOutStream(OutStreamVar);
        OutStreamVar.WriteText(GetLastErrorText());
        ErrorLog."Error Callstack".CreateOutStream(OutStreamVar);
        OutStreamVar.WriteText(GetLastErrorCallStack());
        ErrorLog.Insert(true);
    end;
}
