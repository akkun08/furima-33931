# furima の ER 図

## users テーブル

| Column              | Type     | Options    |
| ------------------- | -------- | ---------- |
| name                | string   | null:false |
| email               | string   | null:false |
| password            | string   | null:false |
| japanese_last_name  | string   | null:false |
| japanese_first_name | string   | null:false |
| kana_last_name      | string   | null:false |
| kana_first_name     | string   | null:false |
| year_month_day      | datetime | null:false |

### Association

- has_many items
- has_many comments
- has_many purchases

## items テーブル

| Column             | Type          | Options    |
| ------------------ | ------------- | ---------- |
| image              | ActiveStorage |            |
| item_name          | text          | null:false |
| item_detail        | text          | null:false |
| category_id        | integer       | null:false |
| state_id           | integer       | null:false |
| shipping_charge_id | integer       | null:false |
| shipping_area_id   | integer       | null:false |
| delivery_day_id    | integer       | null:false |
| price              | integer       | null:false |
| user               | reference     |            |

### Association

- belongs_to user
- has_many comments
- has_one purchase

## purchases テーブル

| Column | Type      | Options |
| ------ | --------- | ------- |
| user   | reference |         |
| item   | reference |         |

### Association

- belongs_to user
- belongs_to item
- has_one purchases_address

## purchases_addresses テーブル

| Column        | Type      | Options    |
| ------------- | --------- | ---------- |
| prefecture_id | integer   | null:false |
| municipality  | string    | null:false |
| address       | string    | null:false |
| building_name | string    |            |
| phone_number  | string    | null:false |
| purchase      | reference |            |

### Association

- belongs_to purchases

## comments テーブル

| Column | Type      | Options    |
| ------ | --------- | ---------- |
| text   | text      | null:false |
| user   | reference |            |
| item   | reference |            |

### Association

- belongs_to user
- belongs_to item
