
//Aakanksha28072025
pageextension 50125 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Item Status"; Rec."Item Status")
            {
                ApplicationArea = all;
                Editable = false;

                trigger OnValidate()
                begin

                end;
            }

        }


    }

    actions
    {
        addafter("Short Close")
        {
            action("Undo Short Close")
            {
                ApplicationArea = All;
                Caption = 'Undo Short Close', comment = 'NLB="Undo short closure of this line."';
                Image = Open;
                trigger OnAction()
                var
                begin
                    CurrPage.Update();
                    Rec.TestField(Type, Rec.Type::Item);
                    if Rec."Short Closed" = true then
                        rec."Short Closed" := false;
                    // rec.Validate("Reason Code",rec."Reason Code");
                    //rec.Validate("Short Close Qty.",rec."Short Close Qty.");
                    rec.Modify();
                    rec.TestField("Short Closed", false);
                end;
                // rec.TestField("Reason Code", '');
                //     rec.TestField("Short Close Qty.", 0);
            }
        }

    }

    trigger OnAfterGetRecord()
    begin
        if rec.Type = Type::Item then begin
            if ItemRec.Get(rec."No.") then begin
                // Transfer Item Status from Item to Purchase Line
                rec."Item Status" := ItemRec.StatusL;
            end;
        end else
            // if (rec.Type = type::" ") or (rec.type = type::"Fixed Asset") or (rec.type = type::"G/L Account") or (rec.type = type::Resource) or (rec.type = type::"Charge (Item)") then begin
                rec."Item Status" := rec."Item Status"::Undefined;
    end;






    var
        ItemRec: Record item;
}