pageextension 50127 "SalesEnqCard" extends "Sales Enquiry Card"
{
    layout
    {
        addafter(City)
        {
            field("Lead Status_"; Rec."Lead Status")
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