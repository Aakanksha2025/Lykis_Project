tableextension 50149 "Purchase Line Exten" extends "Purchase Line"
{
    fields
    {
        field(50142; "Item Status"; Enum "Vend/Cust Status enum")
        {
            Caption = 'Item Status';
            DataClassification = ToBeClassified;
        }
        field(50143; "Proforma Invoice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50144; "PO Status"; Enum "PO Status")
        {
            DataClassification = ToBeClassified;
        }
    }
}
