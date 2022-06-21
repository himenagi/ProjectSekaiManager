package com.projectsekaimanajer.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.GsonBuilder;
import com.projectsekaimanajer.server.services.TestService;

@RestController
@CrossOrigin("*")
public class TestController {

    @Autowired
    private TestService testService;

    @RequestMapping("/test")
    public String test() {
        var gson = new GsonBuilder().setPrettyPrinting().create();
        var units = testService.SelectAllUnits();
        return gson.toJson(units);
    }
}
