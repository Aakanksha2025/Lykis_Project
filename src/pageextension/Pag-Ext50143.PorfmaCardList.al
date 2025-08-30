pageextension 50143 PorfmaCardList extends "Sales Order"
{
    layout
    {
        addafter("Sales Enquiry No.")
        {
            field("Sales Enquiry List"; Rec."Sales Enquiry List")
            {
                Caption = 'Sales Enquiry  List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesHeader: Record "Sales Enquiry Header";
                begin
                    SalesHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesHeader.SetRange("Enquiry No.", Rec."Sales Enquiry No.");
                    Page.Run(Page::"Sales Enquiry List", SalesHeader);
                end;
            }
            field("Costing Sheet List"; Rec."Costing Sheet List")
            {
                Caption = 'Costing Sheet List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    CostingHeader: Record "Costing Sheet Header";
                begin
                    CostingHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    CostingHeader.SetRange("Sales Enquiry No.", Rec."Sales Enquiry No.");
                    Page.Run(Page::"Costing Sheet list", CostingHeader);
                end;
            }

            //Akanksha02072025
            field("Purchase Order List"; Rec."Purchase Order List")
            {
                Caption = 'Purchase Order  List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    PurchHeader.SetRange("Proforma Invoice No.", rec."No.");
                    Page.Run(Page::"Purchase Order List", PurchHeader);
                end;
            }
            //Aakanksha02072025
        }
    }
}
