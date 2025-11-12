pageextension 50149 "SalesEnqList" extends "Sales Enquiry List"
{
    layout
    {
        addafter("Enquiry No.")
        {
            field("Lead Status"; Rec."Lead Status")
            {
                ApplicationArea = all;
                Caption = 'Lead Status';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}