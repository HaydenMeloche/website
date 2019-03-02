package com.hayden.controllers;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/info")
@Api(value="Info Controller", description="Get info about me")
public class InfoController {

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "Hello";
    }
}
