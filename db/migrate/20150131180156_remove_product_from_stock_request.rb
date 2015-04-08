class RemoveProductFromStockRequest < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE SPREE_STOCK_REQUESTS SR
            SET VARIANT_ID = SR_IN.VARIANT_ID
            FROM (
                   SELECT
                     STOCK_REQUESTS.ID,
                     VARIANTS.ID AS VARIANT_ID
                   FROM SPREE_STOCK_REQUESTS STOCK_REQUESTS
                     INNER JOIN SPREE_PRODUCTS PRODUCTS
                       ON STOCK_REQUESTS.PRODUCT_ID = PRODUCTS.ID
                     INNER JOIN SPREE_VARIANTS VARIANTS
                       ON VARIANTS.PRODUCT_ID = PRODUCTS.ID
                          AND VARIANTS.IS_MASTER = TRUE
                 ) AS SR_IN
            WHERE SR.VARIANT_ID IS NULL
                  AND SR.ID = SR_IN.ID
        SQL
      end
      dir.down do
        execute <<-SQL
          UPDATE SPREE_STOCK_REQUESTS SR
            SET PRODUCT_ID = REQUESTS.PRODUCT_ID
            FROM (
                   SELECT
                     STOCK_REQUESTS.ID,
                     VARIANTS.PRODUCT_ID
                   FROM SPREE_STOCK_REQUESTS AS STOCK_REQUESTS
                     INNER JOIN SPREE_VARIANTS AS VARIANTS
                       ON STOCK_REQUESTS.VARIANT_ID = VARIANTS.ID
                 ) AS REQUESTS
            WHERE SR.ID = REQUESTS.ID
        SQL
      end
    end

    remove_column :spree_stock_requests, :product_id, :integer
  end
end
