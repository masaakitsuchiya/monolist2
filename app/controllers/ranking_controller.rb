class RankingController < ApplicationController

    def have
        # sql group by -> sum avg max min count の処理しかありません。
        # count の処理は {id1 => count値, id2 => count2}
        itemhash = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
        itemids = itemhash.keys
        # itemidsはランキング順
        @items = itemids.map do |id|
                  Item.find(id)
        end
        
    end
    
    def want
        itemhash = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
        itemids = itemhash.keys
        # itemidsはランキング順
        @items = itemids.map do |id|
                  Item.find(id)
        end
    end
    
end
