tableextension 50149 "Purchase Line Exten" extends "Purchase Line"
{
    fields
    {
        field(50142; "Item Status"; Enum "Vend/Cust Status enum")
        {
            Caption = 'Item Status';
            DataClassification = ToBeClassified;
        }
    }
}
