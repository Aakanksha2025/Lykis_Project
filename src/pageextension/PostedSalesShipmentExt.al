pageextension 60157 MyExtension extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                ApplicationArea = all;
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