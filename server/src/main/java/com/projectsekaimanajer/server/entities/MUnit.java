package com.projectsekaimanajer.server.entities;

import java.time.LocalDateTime;

/**
 * m_unitテーブルに対応するエンティティクラス
 */
public class MUnit {
    /**
     * ユニットID
     */
    public long id;

    /**
     * ユニット名
     */
    public String name;

    /**
     * イメージカラー
     */
    public String imageColor;

    /**
     * 作成日時
     */
    public LocalDateTime createdTime;

    /**
     * 更新日時
     */
    public LocalDateTime updatedTime;
}
