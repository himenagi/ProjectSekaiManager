CREATE TABLE IF NOT EXISTS m_unit(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'ユニットID',
    name VARCHAR(32) NOT NULL COMMENT 'ユニット名',
    image_color VARCHAR(6) NOT NULL COMMENT 'イメージカラー',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id)
)
DEFAULT CHARSET = utf8
COMMENT 'ユニットマスタ';

CREATE TABLE IF NOT EXISTS m_character(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キャラクターID',
    name VARCHAR(32) NOT NULL COMMENT 'キャラクター名',
    unit_id BIGINT NOT NULL COMMENT 'ユニットID',
    image_color VARCHAR(6) NOT NULL COMMENT 'イメージカラー',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_m_character_unit_id
        FOREIGN KEY (unit_id)
        REFERENCES m_unit (id)
)
DEFAULT CHARSET = utf8
COMMENT 'キャラクターマスタ';

CREATE TABLE IF NOT EXISTS m_character_mission(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キャラクターミッションID',
    content VARCHAR(128) NOT NULL COMMENT 'ミッション内容',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id)
)
DEFAULT CHARSET = utf8
COMMENT 'キャラクターミッションマスタ';

CREATE TABLE IF NOT EXISTS m_character_mission_request_count(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キャラクターミッション要求数ID',
    character_mission_id BIGINT NOT NULL COMMENT 'キャラクターミッションID',
    request_count INT NOT NULL COMMENT '要求数',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_m_charcter_mission_character_mission_id
        FOREIGN KEY (character_mission_id)
        REFERENCES m_character_mission (id)
)
DEFAULT CHARSET = utf8
COMMENT 'キャラクターミッション要求数マスタ';

CREATE TABLE IF NOT EXISTS m_skill(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'スキルID',
    content VARCHAR(128) NOT NULL COMMENT 'スキル内容',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id)
)
DEFAULT CHARSET = utf8
COMMENT 'スキルマスタ';

CREATE TABLE IF NOT EXISTS m_skill_effect_size(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'スキル効果量ID',
    skill_id BIGINT NOT NULL COMMENT 'スキルID',
    level SMALLINT NOT NULL COMMENT 'スキルレベル',
    value1 INT COMMENT '効果量1',
    value2 INT COMMENT '効果量2',
    value3 INT COMMENT '効果量3',
    value4 INT COMMENT '効果量4',
    value5 INT COMMENT '効果量5',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_m_skill_effect_size_skill_id
        FOREIGN KEY (skill_id)
        REFERENCES m_skill (id)
)
DEFAULT CHARSET = utf8
COMMENT 'スキル効果量マスタ';

CREATE TABLE IF NOT EXISTS t_card(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'カードID',
    character_id BIGINT NOT NULL COMMENT 'キャラクターID',
    sub_unit_id BIGINT NOT NULL COMMENT 'サブユニットID',
    rarelity SMALLINT NOT NULL COMMENT 'レアリティ',
    accompany_costume BOOLEAN NOT NULL COMMENT '衣装付きかどうか',
    type BOOLEAN NOT NULL COMMENT 'タイプ',
    title VARCHAR(32) NOT NULL COMMENT '肩書き',
    performance INT NOT NULL COMMENT 'パフォーマンス',
    technique INT NOT NULL COMMENT 'テクニック',
    stamina INT NOT NULL COMMENT 'スタミナ',
    skill_id BIGINT NOT NULL COMMENT 'スキルID',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_card_character_id
        FOREIGN KEY (character_id)
        REFERENCES m_character (id),
    CONSTRAINT fk_t_card_sub_unit_id
        FOREIGN KEY (sub_unit_id)
        REFERENCES m_unit (id),
    CONSTRAINT fk_t_card_skill_id
        FOREIGN KEY (skill_id)
        REFERENCES m_skill (id)
)
DEFAULT CHARSET = utf8
COMMENT 'カード';

CREATE TABLE IF NOT EXISTS t_character_mission_progress(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キャラクターミッション進捗ID',
    character_id BIGINT NOT NULL COMMENT 'キャラクターID',
    character_mission_id BIGINT NOT NULL COMMENT 'キャラクターミッションID',
    completed_request_count_id BIGINT NOT NULL COMMENT 'キャラクターミッション要求数ID',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_character_mission_progress_character_id
        FOREIGN KEY (character_id)
        REFERENCES m_character (id),
    CONSTRAINT fk_t_character_mission_progress_character_mission_id
        FOREIGN KEY (character_mission_id)
        REFERENCES m_character_mission (id),
    CONSTRAINT fk_t_character_mission_progress_completed_request_count_id
        FOREIGN KEY (completed_request_count_id)
        REFERENCES m_character_mission_request_count (id)
)
DEFAULT CHARSET = utf8
COMMENT 'キャラクターミッション進捗';

CREATE TABLE IF NOT EXISTS t_challenge_stage(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'チャレンジステージID',
    character_id BIGINT NOT NULL COMMENT 'キャラクターID',
    stage_count INT NOT NULL COMMENT 'ステージ数',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_challenge_stage_character_id
        FOREIGN KEY (character_id)
        REFERENCES m_character (id)
)
DEFAULT CHARSET = utf8
COMMENT 'チャレンジステージ';

CREATE TABLE IF NOT EXISTS t_side_story_progress(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'サイドストーリー進捗ID',
    card_id BIGINT NOT NULL COMMENT 'カードID',
    progress SMALLINT NOT NULL COMMENT '進捗',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_side_story_progress_character_id
        FOREIGN KEY (card_id)
        REFERENCES t_card (id)
)
DEFAULT CHARSET = utf8
COMMENT 'サイドストーリー進捗';

CREATE TABLE IF NOT EXISTS t_master_rank(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'マスターランクID',
    card_id BIGINT NOT NULL COMMENT 'カードID',
    master_rank SMALLINT NOT NULL COMMENT 'マスターランク',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_master_rank_character_id
        FOREIGN KEY (card_id)
        REFERENCES t_card (id)
)
DEFAULT CHARSET = utf8
COMMENT 'マスターランク';

CREATE TABLE IF NOT EXISTS t_skill_level(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'スキルレベルID',
    card_id BIGINT NOT NULL COMMENT 'カードID',
    level SMALLINT NOT NULL COMMENT 'スキルレベル',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_skill_level_character_id
        FOREIGN KEY (card_id)
        REFERENCES t_card (id)
)
DEFAULT CHARSET = utf8
COMMENT 'スキルレベル';

CREATE TABLE IF NOT EXISTS t_costume(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT '衣装ID',
    name VARCHAR(32) NOT NULL COMMENT '衣装名',
    variation SMALLINT NOT NULL COMMENT 'バリエーション',
    character_id BIGINT NOT NULL COMMENT 'キャラクターID',
    acquisition_method SMALLINT NOT NULL COMMENT '取得方法',
    card_id BIGINT NOT NULL COMMENT '取得元カードID',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_costume_character_id
        FOREIGN KEY (character_id)
        REFERENCES m_character (id),
    CONSTRAINT fk_t_costume_card_id
        FOREIGN KEY (card_id)
        REFERENCES t_card (id)
)
DEFAULT CHARSET = utf8
COMMENT '衣装';

CREATE TABLE IF NOT EXISTS t_stamp(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'スタンプID',
    character_id BIGINT NOT NULL COMMENT 'キャラクターID',
    acquisition_method SMALLINT NOT NULL COMMENT '取得方法',
    event_name VARCHAR(64) COMMENT 'イベント名',
    event_start_date DATE COMMENT 'イベント開始日',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_stamp_character_id
        FOREIGN KEY (character_id)
        REFERENCES m_character (id)
)
DEFAULT CHARSET = utf8
COMMENT 'スタンプ';

CREATE TABLE IF NOT EXISTS t_bond_rank(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キズナランクID',
    character_id1 BIGINT NOT NULL COMMENT 'キャラクターID1',
    character_id2 BIGINT NOT NULL COMMENT 'キャラクターID2',
    bond_rank SMALLINT NOT NULL COMMENT 'キズナランク',
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY(id),
    CONSTRAINT fk_t_bond_rank_character_id1
        FOREIGN KEY (character_id1)
        REFERENCES m_character (id),
    CONSTRAINT fk_t_bond_rank_character_id2
        FOREIGN KEY (character_id2)
        REFERENCES m_character (id)
)
DEFAULT CHARSET = utf8
COMMENT 'キズナランク';
