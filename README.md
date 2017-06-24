# DB設計　

## users table
| Field	   | Type    | Null | Key  | Default | Extra          |
|:-----------|:--------|:-----|:-----|:--------|:---------------|
| id         | INT     | No   | PRI  |         | auto_increment |
| name       | VARCHAR | Yes  |      | Null    |                |
| e-mail     | VARCHAR | Yes  |      | Null    |                |
| password   | VARCHAR | Yes  |      | Null    |                |

### Association
* has_many :groups, through: :users_groups
* has_many :users_groups
* has_many :messages

## groups table
| Field	   | Type    | Null | Key  | Default | Extra          |
|:-----------|:--------|:-----|:-----|:--------|:---------------|
| id         | INT     | No   | PRI  |         | auto_increment |
| group_name | VARCHAR | Yes  |      | Null    |                |

### Association
* has_many :users, through: :users_groups
* has_many :users_groups
* has_many :messages

## users_groups table
| Field	   | Type    | Null | Key  | Default | Extra          |
|:-----------|:--------|:-----|:-----|:--------|:---------------|
| user_id    | INT     | Yes  |      | Null    |                |
| group_id   | INT     | Yes  |      | Null    |                |

### Association
* belongs_to:user
* belongs_to:group

## messages table
| Field	   | Type    | Null | Key  | Default | Extra          |
|:-----------|:--------|:-----|:-----|:--------|:---------------|
| id         | INT     | No   | PRI  |         | auto_increment |
| message    | TEXT    | Yes  |      | Null    |                |
| image      | VARCHAR | Yes  |      | Null    |                |
| user_id    | INT     | Yes  |      | Null    |                |
| group_id   | INT     | Yes  |      | Null    |                |

### Association
* belongs_to:user
* belongs_to:group
