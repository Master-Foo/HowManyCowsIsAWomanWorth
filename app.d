#! /usr/bin/env rdmd

import std.stdio;
import std.conv;
import std.format;
import std.math;
import std.range;

Subject[] test_subjects = [
    {
        name: "Jennifer Lawrence",
        age: 28,
        children: 0,
        hotness: 9.75,
        skin_albedo: .6,
        net_worth: 130000000,
        divorces: 0
    },
    {
        name: "Hillary Clinton",
        age: 72,
        children: 1,
        hotness: 5,
        skin_albedo: .6,
        net_worth: 45000000,
        divorces: 0
    },
    {
        name: "X",
        age: 20,
        children: 0,
        hotness: 10,
        skin_albedo: .6,
        net_worth: 0,
        divorces: 0
    },
    {
        name: "Y",
        age: 25,
        children: -5,
        hotness: 7,
        skin_albedo: .05,
        net_worth: -10000,
        divorces: 5
    }
];

struct Subject{
    string  name            = "";
    int     age             = 0;
    int     children        = 0;
    float   hotness         = 0;
    float   skin_albedo     = .6;
    float   net_worth       = 0;
    float   cow_value       = 500;
    float   divorces        = 0;

    float calculate_children(){
        int modifier = 10;
        return this.children * modifier;
    }

    float calculate_divorces(){
        int modifier = -10;

        return pow(this.divorces,2) * modifier;
    }

    float calculate_fertility(){
        //https://www.singstat.gov.sg/modules/infographics/total-fertility-rate
        int modifier = 10;
        float value = 0;
        float min = 15;
        float max = 49;

        if(this.age < 15){
            value = 0;
        }else if(this.age >= 15 && this.age <= 19){
            value = .026;
        }else if(this.age >= 20 && this.age <= 24){
            value = .145;
        }else if(this.age >= 25 && this.age <= 29){
            value = .608;
        }else if(this.age >= 30 && this.age <= 34){
            value = .93;
        }else if(this.age >= 35 && this.age <= 39){
            value = .484;
        }else if(this.age >= 40 && this.age <= 44){
            value = .088;
        }else if(this.age >= 45 && this.age <= 49){
            value = .005;
        }else{
            value = 0;
        }

        return value * modifier;
    }

    float calculate_hotness(){
        float min = 0;
        float max = 10;
        int modifier = 10;

        return normalize(this.hotness, min, max) * modifier;
    }

    float calculate_skin_albedo(){
        float min = .05;
        float max = .6;
        int modifier = 10;

        return this.normalize(this.skin_albedo, min, max) * modifier;
    }

    float calculate_net_worth(){
        return this.net_worth / this.cow_value;
    }

    float calculate_value(){
        return (
            this.calculate_skin_albedo +
            this.calculate_children +
            this.calculate_fertility +
            this.calculate_hotness +
            this.calculate_divorces +
            this.calculate_net_worth
        );
    }

    string toString() {
        return format("%s is worth %f cows.", this.name, this.calculate_value() );
    }

    float normalize(float x, float min, float max){
        return (x < min || x > max) ? 0 : (x - min) / (max - min);
    }
}


void main(string[] args){
    foreach(Subject subject; test_subjects){
        writeln(
            subject
        );
    }
}

