#! /usr/bin/env rdmd

import std.stdio;
import subject;
import data;


void main(string[] args){
    foreach(Subject subject; test_subjects){
        writeln(subject);
    }
}
