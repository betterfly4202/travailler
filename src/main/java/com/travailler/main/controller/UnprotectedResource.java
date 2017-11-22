package com.travailler.main.controller;

/**
 * Created by betterFLY on 2017-11-22.
 */


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/unprotecteddemo")
public class UnprotectedResource {
    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public String getGreeting(@PathVariable String name) {
        String result = "Hello " + name +"\n This is a unprotected page.";
        return result;
    }
}