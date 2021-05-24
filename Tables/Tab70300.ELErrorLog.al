table 70300 "EL Error Log"
{
    Caption = 'Error Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Error Message"; Blob)
        {
            Caption = 'Error Message';
            DataClassification = CustomerContent;
        }
        field(3; "Error Callstack"; Blob)
        {
            Caption = 'Error Callstack';
            DataClassification = CustomerContent;
        }
        field(4; "Error Text"; Text[2048])
        {
            Caption = 'Error Text';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    procedure ShowErrorMessage()
    var
        InStreamVar: InStream;
        TextValue: Text;
    begin
        if not Rec."Error Message".HasValue() then
            exit;

        Rec.CalcFields("Error Message");
        Rec."Error Message".CreateInStream(InStreamVar);
        InStreamVar.ReadText(TextValue);
        Message(TextValue);
    end;

    procedure ShowErrorCallstack()
    var
        InStreamVar: InStream;
        TextValue: Text;
    begin
        if not Rec."Error Callstack".HasValue() then
            exit;

        Rec.CalcFields("Error Callstack");
        Rec."Error Callstack".CreateInStream(InStreamVar);
        InStreamVar.ReadText(TextValue);
        Message(TextValue);
    end;
}
