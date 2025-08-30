pageextension 50141 "Costing Sheet Card Ext" extends "Costing Sheet Card"
{
    layout
    {
        addafter(Division)
        {
            field("Purchase Quote List"; Rec."Purchase Quote List")
            {
                Caption = 'Purchase Quote List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    PurchHr: Record "Purchase Header";
                begin
                    PurchHr.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    PurchHr.SetRange("Enquiry No.", Rec."Sales Enquiry No.");
                    Page.Run(Page::"Purchase Quotes", PurchHr);
                end;
            }
            field("Performa Invoice List"; Rec."Performa Invoice List")
            {
                Caption = 'Performa Invoice List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesHeader.SetRange("Sales Enquiry No.", rec."Sales Enquiry No.");
                    Page.Run(Page::"Sales Order List", SalesHeader);
                end;
            }

        }

    }


    var
        myInt: Integer;
}