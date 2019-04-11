% matpan.m
% script based on DAFX p 140 to
% perform matrix based panning of mono sound to stereo
function [y, Fs] = matpan(x, Fs, pan)

angle = pan * pi / 180; %in radians

y=[[];[]];

A =[cos(angle), sin(angle); -sin(angle), cos(angle)];
stereox = [x;x];
y = [y, A * stereox];
