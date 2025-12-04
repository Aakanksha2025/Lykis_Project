pageextension 50137 "POSubformExt" extends "Purchase Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Proforma Invoice No"; Rec."Proforma Invoice No")
            {
                ApplicationArea = all;
            }
            field("PO Status"; Rec."PO Status")
            {
                ApplicationArea = all;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    begin
        RecPO.Reset();
        RecPO.SetRange("No.", Rec."Document No.");
        if RecPO.FindSet() then
            rec."Proforma Invoice No" := RecPO."Proforma Invoice No.";

        RecPO_.Reset();
        RecPO_.SetRange("No.", Rec."Document No.");
        if RecPO_.FindSet() then begin
            PurchaseStatus := RecPO_.Status;
            case PurchaseStatus of
                PurchaseStatus::Open:
                    Rec."PO Status" := Rec."PO Status"::Open;

                PurchaseStatus::Released:
                    Rec."PO Status" := Rec."PO Status"::Released;

                PurchaseStatus::"Pending Approval":
                    Rec."PO Status" := Rec."PO Status"::"Pending for Approval";

                PurchaseStatus::"Pending Prepayment":
                    Rec."PO Status" := Rec."PO Status"::"Pending Prepayment";

            end;
        end;
    end;


    var
        RecPO: Record "Purchase Header";
        RecPO_: Record "Purchase Header";
        PurchaseStatus: Enum "Purchase Document Status";

}