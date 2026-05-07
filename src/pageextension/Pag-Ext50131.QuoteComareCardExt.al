pageextension 50131 QuoteComareCardExt extends "Quote Compare Card"
{
    layout
    {


        addafter(Remark)
        {
            field("Purchase Quote"; rec."Purchase Quote")
            {
                Caption = 'Purchase Quote List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    PurchHeader.SetRange("RFQ No.", Rec."RFQ No");
                    Page.Run(Page::"Purchase Quotes", PurchHeader);
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
                    CostingHeader.SetRange("Sales Enquiry No.", Rec."SE No.");
                    Page.Run(Page::"Costing Sheet list", CostingHeader);
                end;
            }

            field("Porfoma Invoice List"; Rec."Porfoma Invoice List")
            {
                Caption = 'Porfoma Invoice List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesHeader.SetRange("Sales Enquiry No.", Rec."SE No.");
                    Page.Run(Page::"Sales Order List", SalesHeader);
                end;
            }
        }
        addafter("RFQ No")
        {
            field("REQ List"; Rec."REQ List")
            {
                Caption = 'RFQ List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    ReqHeader: Record "Request For Quotation Header ";
                begin
                    ReqHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    ReqHeader.SetRange("RFQ No.", Rec."RFQ No");
                    Page.Run(Page::"Request For Quotation List", ReqHeader);
                end;
            }

        }


        addafter("SE No.")
        {
            field("Sales Enquiry List"; Rec."Sales Enquiry List")
            {
                Caption = 'Sales Enquiry List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesEnqHeader: Record "Sales Enquiry Header";
                begin
                    SalesEnqHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesEnqHeader.SetRange("Enquiry No.", Rec."SE No.");
                    Page.Run(Page::"Sales Enquiry List", SalesEnqHeader);
                end;
            }
        }


    }

    actions
    {
        addafter("Release")
        {
            action(UpdateHSNCode)
            {
                ApplicationArea = All;
                Caption = 'Update HSN Code';
                Image = Refresh;

                trigger OnAction()
                var
                    QuoteCompLine: Record "Quote Compare Line";
                begin
                    if Rec."Approval StatusL" <> Rec."Approval StatusL"::Open then begin
                        Message('HSN Code cannot be updated because the document status is not Open.');
                        exit;
                    end;

                    QuoteCompLine.SetRange("Quote Comparison No.", Rec."Quote Comparison No.");

                    if QuoteCompLine.FindSet() then begin
                        repeat
                            QuoteCompLine."HSN Code" := GetHSNCodeForItem(QuoteCompLine."Item No.");
                            QuoteCompLine.Modify(true);
                        until QuoteCompLine.Next() = 0;

                        Message('HSN Codes have been updated successfully.');
                    end else
                        Message('No purchase lines found to update.');
                end;

            }
        }

    }
    local procedure GetHSNCodeForItem(ItemNo: Code[20]): Code[20]
    var
        Item: Record Item;
    begin
        if Item.Get(ItemNo) then
            exit(Item."HSN/SAC Code")
        else
            exit('');
    end;

}




