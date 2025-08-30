codeunit 50146 ApprovalCodeunit
{
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnBeforeIsPurchaseApprovalsWorkflowEnabled, '', false, false)]
    // local procedure "Approvals Mgmt._OnBeforeIsPurchaseApprovalsWorkflowEnabled"(var PurchaseHeader: Record "Purchase Header"; var Result: Boolean; var IsHandled: Boolean)
    // var
    //     PurchLine: Record "Purchase Line";
    //     RecRef: RecordRef;
    // begin
    //     Message('test');
    // end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnBeforeCheckPurchaseApprovalPossible, '', false, false)]
    // local procedure "Approvals Mgmt._OnBeforeCheckPurchaseApprovalPossible"(var PurchaseHeader: Record "Purchase Header"; var Result: Boolean; var IsHandled: Boolean)
    // var
    //     PurchLine: Record "Purchase Line";
    //     RecRef: RecordRef;
    // begin
    //     if RecRef.Number = DATABASE::"Purchase Header" then begin
    //         RecRef.SetTable(PurchaseHeader);

    //         // Check if it's a Purchase Quote
    //         if PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Quote then
    //             exit;

    //         // Only proceed if status is Open
    //         if PurchaseHeader.Status <> PurchaseHeader.Status::Open then begin
    //             Message('HSN Code cannot be updated because the document status is not Open.');
    //             exit;
    //         end;

    //         PurchLine.SetRange("Document Type", PurchaseHeader."Document Type");
    //         PurchLine.SetRange("Document No.", PurchaseHeader."No.");

    //         if PurchLine.FindSet() then begin
    //             repeat
    //                 PurchLine.Validate("HSN/SAC Code", GetHSNCodeForItem(PurchLine."No."));
    //                 PurchLine.Modify();
    //             until PurchLine.Next() = 0;

    //             Message('HSN Codes have been updated successfully.');
    //         end else
    //             Message('No purchase lines found to update.');
    //     end;
    // end;

    // local procedure GetHSNCodeForItem(ItemNo: Code[20]): Code[20]
    // var
    //     Item: Record Item;
    // begin
    //     if Item.Get(ItemNo) then
    //         exit(Item."HSN/SAC Code")
    //     else
    //         exit('');
    // end;

   


}
