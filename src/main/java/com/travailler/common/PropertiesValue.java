package com.travailler.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Created by betterFLY on 2017-11-20.
 */

@Component
public class PropertiesValue {

    @Value("#{web_properties['file.addonfile.save.path']}")
    public String file_addonfile_save_path;

}
