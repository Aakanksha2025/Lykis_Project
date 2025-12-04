tableextension 50137 SalesLine_Ext extends "Sales Line"
{
    fields
    {
        field(50137; "PI_Posting Date"; Date)
        {
            Caption = 'PI_Posting Date';
            DataClassification = ToBeClassified;
        }
        field(50138; "PI_Due Date"; Date)
        {
            Caption = 'PI_Due Date';
            DataClassification = ToBeClassified;
        }
        field(50139; "PI_Approved Date-Time"; DateTime)
        {
            Caption = 'PI_Approved Date-time';
            DataClassification = ToBeClassified;
        }
        field(50140; "PO Status Field"; Enum "PO Status enum")
        {
            DataClassification = ToBeClassified;
        }

        
    }
    
}
