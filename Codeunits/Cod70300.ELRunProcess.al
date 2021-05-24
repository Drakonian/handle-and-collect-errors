codeunit 70300 "EL Run Process"
{
    trigger OnRun()
    begin
        InsertRecord();
    end;

    procedure SetParams(RandomInt: Integer)
    begin
        gRandomInt := RandomInt;
    end;

    local procedure InsertRecord()
    var
        SimulateTransaction: Record "EL Simulate Transaction";
    begin
        SimulateTransaction.Init();
        case gRandomInt of
            1:
                SimulateTransaction."Is Insert" := false;
            2:
                SimulateTransaction."Is Insert" := true;
        end;
        SimulateTransaction.Insert(true);
    end;

    var
        gRandomInt: Integer;
}
