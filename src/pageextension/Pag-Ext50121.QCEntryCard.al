pageextension 50121 "QC Entry Card" extends "QC Entry Card"
{

    layout
    {

        addafter("Item ID")
        {
            // field("Item Category Code"; Rec."Item Category Code")
            // {
            //     ApplicationArea = all;


            // }
        }
        // modify("PO No.")
        // {

        //     // trigger OnDrillDown()
        //     // var
        //     //     PurchHeader: Record "Purchase Header";
        //     // begin

        //     //         Page.Run(Page::"Purchase Order", PurchHeader);

        //     // end;
        // }

    }
    // //Aakanksha18072025
    // trigger OnAfterGetRecord()
    // begin
    //     RecItem.SetRange("No.", rec."Item ID");
    //     if RecItem.FindSet() then begin
    //         rec."Item Category Code" := RecItem."Item Category Code";
    //     end;
    // end;

    var
        RecItem: Record item;

}