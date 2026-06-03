<?php
/**
 * mysql8,mysql5 example
 * @example https://docs.phpmyadmin.net/en/latest/config.html
 */

$cfg['blowfish_secret']='multiServerExample70518';

$i = 0;

$i++; // server 1 :
$cfg['Servers'][$i]['verbose']   = 'no1';
$cfg['Servers'][$i]['host']      = 'mysql8';

//$i++; // server 2 :
//$cfg['Servers'][$i]['verbose']   = 'no2';
//$cfg['Servers'][$i]['host']      = 'mysql5';

