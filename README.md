# Posts_table
|Columns|Type|Options|
|-------|----|-------|
|title|string|null:false|
|text|text|null:false|
|image|string|null:false|
|tag_id|references|foreign_key:true|
|user_id|references|foreign_key:true|
## Association
- belongs_to :user
- belongs_to :tag
- has_many :comments, dependent: :destroy


# Tags_table
|Columns|Type|Options|
|-------|----|-------|
|tag_name|string|null:false|
## Association
- has_many :posts


# Comments_table
|Columns|Type|Options|
|-------|----|-------|
|comment|text||
|post_id|references|foreign_key:true|
|user_id|references|foreign_key:true|
## Association
- belongs_to :post
- belongs_to :user


# Users_table
|Columns|Type|Options|
|-------|----|-------|
|name|string|null:false|
|nickname|string|null:false|
|email|string|null:false|
|password|string|null:false|
## Association
- has_many :posts, dependent: :destroy
- has_many :comments
- has_many :groups


# Groups_table
|Columns|Type|Options|
|-------|----|-------|
|group_name|string|null:false|
## Association
- has_many :users