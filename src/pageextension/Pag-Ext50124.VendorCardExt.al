pageextension 50124 "Vendor Card Ext" extends "Vendor Card"
{
    layout
    {
        addafter("Preferred Bank Account Code")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }
        }
        modify("Country/Region Code")
        {
            ShowMandatory = true;
        }
        modify(City)
        {
            ShowMandatory = true;
        }
        modify("Post Code")
        {
            ShowMandatory = true;
        }
        modify("Location Code")
        {
            ShowMandatory = true;
        }
        modify("Purchaser Code")
        {
            ShowMandatory = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}