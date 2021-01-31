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
| year                | datetime | null:false |
| month               | datetime | null:false |
| day                 | datetime | null:false |

### Association

- has_many items
- has_many comments
- has_many purchases

## items テーブル

| Column          | Type          | Options    |
| --------------- | ------------- | ---------- |
| image           | ActiveStorage |            |
| item_name       | text          | null:false |
| item_detail     | text          | null:false |
| category        | string        | null:false |
| state           | string        | null:false |
| shipping_charge | string        | null:false |
| shipping_area   | string        | null:false |
| delivery_day    | string        | null:false |
| price           | string        | null:false |
| user_id         | reference     |            |

### Association

- belongs_to user
- has_many comments
- has_one purchases

## purchases テーブル

| Column              | Type      | Options |
| ------------------- | --------- | ------- |
| user_id             | reference |         |
| item_id             | reference |         |
| purchase_address_id | reference |         |

### Association

- belongs_to user
- belongs_to item
- has_one purchases_address

## purchases_addresses テーブル

| Column        | Type      | Options    |
| ------------- | --------- | ---------- |
| prefecture    | string    | null:false |
| municipality  | string    | null:false |
| address       | string    | null:false |
| building_name | string    | null:false |
| phone_number  | string    | null:false |
| purchase_id   | reference |            |

### Association

- belongs_to purchases

## comments テーブル

| Column  | Type      | Options    |
| ------- | --------- | ---------- |
| text    | text      | null:false |
| user_id | reference |            |
| item_id | reference |            |

### Association

- belongs_to user
- belongs_to item
