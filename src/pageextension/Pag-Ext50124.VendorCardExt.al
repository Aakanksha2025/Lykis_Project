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


    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        MissingFields: Text;
    begin
        MissingFields := '';

        if Rec.Name = '' then
            MissingFields += 'Name, ';

        if Rec."Location Code" = '' then
            MissingFields += 'Location Code, ';

        if Rec."Purchaser Code" = '' then
            MissingFields += 'Purchaser Code, ';

        if Rec."GST Vendor Type" = Rec."GST Vendor Type"::" " then
            MissingFields += 'GST Vendor Type, ';

        if Rec."Gen. Bus. Posting Group" = '' then
            MissingFields += 'Gen. Bus. Posting Group, ';

        if Rec."Vendor Posting Group" = '' then
            MissingFields += 'Vendor Posting Group, ';

        // If anything is missing → show all fields in one message
        if MissingFields <> '' then begin
            Message(
                'Please fill the following mandatory fields before closing the page:\%1',
                MissingFields);
            exit(false); // Prevent closing the page
        end;

        exit(true); // Allow closing the pages
    end;


    var
        myInt: Integer;
}