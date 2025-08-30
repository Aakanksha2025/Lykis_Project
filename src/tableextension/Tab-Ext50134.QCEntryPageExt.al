tableextension 50134 QCEntryPageExt extends "QC Entry Header"
{
    fields
    {
        field(50134; "Item Category Code"; code[20])//Aakanksha 18072025
        {
            DataClassification = ToBeClassified;
        }
        modify("PO No.")
        {
            TableRelation = "Purchase Header"."No." where("No." = field("PO No."));
        }
    }
}
