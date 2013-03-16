<?php

include_once '/usr/share/php-geshi/geshi.php';

/**
 * parseArgs Command Line Interface (CLI) utility function.
 * @usage               $args = parseArgs($_SERVER['argv']);
 * @author              Patrick Fisher <patrick@pwfisher.com>
 * @source              https://github.com/pwfisher/CommandLine.php
 */
function parseArgs($argv)
{
    array_shift($argv);
    $out = array();
    foreach ($argv as $arg)
    {
        if (substr($arg,0,2) == '--')
        {
            $eqPos = strpos($arg,'=');
            if ($eqPos === false)
            {
                $key = substr($arg,2);
                $out[$key] = isset($out[$key]) ? $out[$key] : true;
            }
            else
            {
                $key = substr($arg,2,$eqPos-2);
                $out[$key] = substr($arg,$eqPos+1);
            }
        }
        else if (substr($arg,0,1) == '-')
        {
            if (substr($arg,2,1) == '=')
            {
                $key = substr($arg,1,1);
                $out[$key] = substr($arg,3);
            }
            else
            {
                $chars = str_split(substr($arg,1));
                foreach ($chars as $char)
                {
                    $key = $char;
                    $out[$key] = isset($out[$key]) ? $out[$key] : true;
                }
            }
        }
        else
        {
            $out[] = $arg;
        }
    }
    return $out;
}

$a = parseArgs($_SERVER['argv']);

if (is_dir($a['sourcedir'])) {
    if ($dh = opendir($a['sourcedir'])) {
        while (($file = readdir($dh)) !== false) {
          if (strpos($file, ".mxml") != false)
          {
            $fa = file($a['sourcedir'] . "/" . $file);
            $fs = "";
            foreach($fa as $line)
            {
              $fs = $fs . $line;
            }
            $code = geshi_highlight($fs, 'mxml', '/usr/share/php-geshi/geshi', true);

            $pfn = substr($file, 0, strlen($file) - 5);
            $nfn = $a['outputdir'] . "/" . $pfn . ".html";

            $code = '<html><head><meta name="viewport" content="initial-scale=0.5"/></head><body>' . $code . '</body></html>';

            $fh = fopen($nfn, 'w');
            fwrite($fh, $code);
            fclose($fh);
          }
        }
        closedir($dh);
    }
}

/*

geshi_highlight($source, 'php', $path);

// Get the code back, for use later
$code = geshi_highlight($source, 'java', $path, true);

// Check if there is an error with parsing this code

ob_start();
$result = geshi_highlight($source, 'perl', $path);
$code = ob_get_contents();

ob_end_clean();
if ( !$result )
{
    // There was an error with highlighting...
}
else
{
    // All OK :)
}
*/

?>
