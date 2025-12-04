pageextension 50139 SalesOrderSubExt extends "Sales Order Subform"
{
    layout
    {
        addafter("Description 2")
        {
            field("PI_Posting Date"; Rec."PI_Posting Date")
            {
                ApplicationArea = all;
                Caption = 'Proforma Invoice Date';
                Editable = false;
            }
            field("PI_Due Date"; Rec."PI_Due Date")
            {
                ApplicationArea = all;
                Caption = 'Proforma Invoice Due Date';
                Editable = false;
            }
            field("PI_Approved Date-Time"; Rec."PI_Approved Date-Time")
            {
                ApplicationArea = all;
                Caption = 'Proforma Invoice Approve Date';
                Editable = false;
            }
            field("PO Status Field"; Rec."PO Status Field")
            {
                ApplicationArea = all;
                Caption = 'PO Status';
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        RecSalesHr.Reset();
        RecSalesHr.SetRange("No.", Rec."Document No.");
        //RecSalesHr.SetRange("Sales Enquiry No.", rec."Sales Enquiry No.");
        if RecSalesHr.FindSet() then
            Rec."PI_Approved Date-Time" := RecSalesHr."Approved Date-Time";
        rec."PI_Posting Date" := RecSalesHr."Posting Date";
        rec."PI_Due Date" := RecSalesHr."Due Date";

        // RecPurchHr.Reset();
        // RecPurchHr.SetRange("Proforma Invoice No.", Rec."Document No.");
        // if RecPurchHr.FindSet() then
        // Rec."PO Status Field":= RecPurchHr.Status;
        Clear(PurchaseStatus);
        RecPurchHr.Reset();
        RecPurchHr.SetRange("PO_Proforma Invoice No.", Rec."Document No.");

        if RecPurchHr.FindSet() then begin
            PurchaseStatus := RecPurchHr.Status;
            case PurchaseStatus of
                PurchaseStatus::Open:
                    Rec."PO Status Field" := Rec."PO Status Field"::Open;

                PurchaseStatus::Released:
                    Rec."PO Status Field" := Rec."PO Status Field"::Released;

                PurchaseStatus::"Pending Approval":
                    Rec."PO Status Field" := Rec."PO Status Field"::"Pending for Approval";

                PurchaseStatus::"Pending Prepayment":
                    Rec."PO Status Field" := Rec."PO Status Field"::"Pending Prepayment";

            end;
        end;
    end;


    var
        RecSalesHr: Record "Sales Header";
        RecPurchHr: Record "Purchase Header";
        PurchaseStatus: Enum "Purchase Document Status";
}
