package com.projectsekaimanajer.server.tables;

import lombok.Getter;
import lombok.Setter;

public class Unit {
    @Getter
    @Setter
    private Long id;

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private String imageColor;
}
