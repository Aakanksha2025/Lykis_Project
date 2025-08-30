pageextension 50133 PurchQuoteExt extends "Purchase Quote"
{

    layout
    {

        addafter("RFQ No.")
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
                    ReqHeader.SetRange("RFQ No.", Rec."RFQ No.");
                    Page.Run(Page::"Request For Quotation List", ReqHeader);
                end;
            }
            field("Quote Compare List"; Rec."Quote Compare List")
            {
                Caption = 'Quote Compare List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    QCCompHeader: Record "Quote Compare Header";
                begin
                    QCCompHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    QCCompHeader.SetRange("RFQ No", Rec."RFQ No.");
                    Page.Run(Page::"Quote Compare List", QCCompHeader);
                end;
            }

        }

        addafter("Enquiry No.")
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
                    SalesEnqHeader.SetRange("Enquiry No.", Rec."Enquiry No.");
                    Page.Run(Page::"Sales Enquiry List", SalesEnqHeader);
                end;
            }

            field("Purchase Order List"; Rec."Purchase Order List")
            {
                Caption = 'Purchase Order List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    PurchHeader.SetRange("Enquiry No.", Rec."Enquiry No.");
                    Page.Run(Page::"Purchase Order List", PurchHeader);
                end;
            }
        }


    }
    actions
    {
        modify(SendApprovalRequest)
        {
            trigger OnAfterAction()
            var
                RecPurchLine: Record "Purchase Line";
                PurchLine: Record "Purchase Line";
            begin
                // begin
                //     if RecPurchLine.Quantity <= 0 then begin
                //         Error('Approved quantity should not be zero or blank.');
                //     end;
                // END;

                begin
                    if Rec.Status <> Rec.Status::Open then begin
                        Message('HSN Code cannot be updated because the document status is not Open.');
                        exit;
                    end;

                    PurchLine.SetRange("Document Type", Rec."Document Type");
                    PurchLine.SetRange("Document No.", Rec."No.");

                    if PurchLine.FindSet() then begin
                        repeat
                            PurchLine.Validate("HSN/SAC Code", GetHSNCodeForItem(PurchLine."No."));
                            PurchLine.Modify();
                        until PurchLine.Next() = 0;

                        Message('HSN Codes have been updated successfully.');
                    end else
                        Message('No purchase lines found to update.');
                end;

            end;



        }
        addafter("Release")
        {
            action(UpdateHSNCode)
            {
                ApplicationArea = All;
                Caption = 'Update HSN Code';
                Image = Refresh;

                trigger OnAction()
                var
                    PurchLine: Record "Purchase Line";
                begin
                    if Rec.Status <> Rec.Status::Open then begin
                        Message('HSN Code cannot be updated because the document status is not Open.');
                        exit;
                    end;

                    PurchLine.SetRange("Document Type", Rec."Document Type");
                    PurchLine.SetRange("Document No.", Rec."No.");

                    if PurchLine.FindSet() then begin
                        repeat
                            PurchLine.Validate("HSN/SAC Code", GetHSNCodeForItem(PurchLine."No."));
                            PurchLine.Modify();
                        until PurchLine.Next() = 0;

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
