# furima の ER 図

## users テーブル

| Column              | Type   | Options                |
| ------------------- | ------ | ---------------------- |
| name                | string | null:false             |
| email               | string | unique:true,null:false |
| encrypted_password  | string | null:false             |
| japanese_last_name  | string | null:false             |
| japanese_first_name | string | null:false             |
| kana_last_name      | string | null:false             |
| kana_first_name     | string | null:false             |
| year_month_day      | date   | null:false             |

### Association

- has_many items
- has_many comments
- has_many purchases

## items テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ----------------- |
| item_name          | string    | null:false        |
| item_detail        | text      | null:false        |
| category_id        | integer   | null:false        |
| state_id           | integer   | null:false        |
| shipping_charge_id | integer   | null:false        |
| prefecture_id      | integer   | null:false        |
| delivery_day_id    | integer   | null:false        |
| price              | integer   | null:false        |
| user               | reference | foreign_key: true |

### Association

- belongs_to user
- has_many comments
- has_one purchase

## purchases テーブル

| Column | Type      | Options           |
| ------ | --------- | ----------------- |
| user   | reference | foreign_key: true |
| item   | reference | foreign_key: true |

### Association

- belongs_to user
- belongs_to item
- has_one purchases_address

## purchases_addresses テーブル

| Column        | Type      | Options           |
| ------------- | --------- | ----------------- |
| postal_code   | string    | null:false        |
| prefecture_id | integer   | null:false        |
| municipality  | string    | null:false        |
| address       | string    | null:false        |
| building_name | string    |                   |
| phone_number  | string    | null:false        |
| purchase      | reference | foreign_key: true |

### Association

- belongs_to purchase

## comments テーブル

| Column | Type      | Options           |
| ------ | --------- | ----------------- |
| text   | text      | null:false        |
| user   | reference | foreign_key: true |
| item   | reference | foreign_key: true |

### Association

- belongs_to user
- belongs_to item
