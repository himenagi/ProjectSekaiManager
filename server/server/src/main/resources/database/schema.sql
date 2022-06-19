CREATE TABLE IF NOT EXISTS m_unit(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'ユニットID',
    name VARCHAR(32) NOT NULL COMMENT 'ユニット名',
    image_color VARCHAR(6) NOT NULL COMMENT 'イメージカラー',
    PRIMARY KEY(id)
)
DEFAULT CHARSET = utf8
COMMENT 'ユニットマスタ';

CREATE TABLE IF NOT EXISTS m_character(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キャラクターID',
    name VARCHAR(32) NOT NULL COMMENT 'キャラクター名',
    unit_id BIGINT NOT NULL COMMENT 'ユニットID',
    image_color VARCHAR(6) NOT NULL COMMENT 'イメージカラー',
    PRIMARY KEY(id),
    CONSTRAINT fk_unit_id
        FOREIGN KEY (unit_id)
        REFERENCES m_unit (id)
)
DEFAULT CHARSET = utf8
COMMENT 'キャラクターマスタ';

CREATE TABLE IF NOT EXISTS m_charcter_mission(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キャラクターミッションID',
    content VARCHAR(128) NOT NULL COMMENT 'ミッション内容',
    PRIMARY KEY(id)
)
DEFAULT CHARSET = utf8
COMMENT 'キャラクターミッションマスタ';

CREATE TABLE IF NOT EXISTS m_charcter_mission_request_count(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'キャラクターミッション要求数ID',
    character_mission_id BIGINT NOT NULL COMMENT 'キャラクターミッションID',
    request_count INT NOT NULL COMMENT '要求数',
    PRIMARY KEY(id),
    CONSTRAINT fk_character_mission_id
        FOREIGN KEY (character_mission_id)
        REFERENCES m_charcter_mission (id)
)
DEFAULT CHARSET = utf8
COMMENT 'キャラクターミッション要求数マスタ';

CREATE TABLE IF NOT EXISTS m_skill(
    id BIGINT AUTO_INCREMENT NOT NULL COMMENT 'スキルID',
    content VARCHAR(128) NOT NULL COMMENT 'スキル内容',
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
    PRIMARY KEY(id),
    CONSTRAINT fk_skill_id
        FOREIGN KEY (skill_id)
        REFERENCES m_skill (id)
)
DEFAULT CHARSET = utf8
COMMENT 'スキル効果量マスタ';
