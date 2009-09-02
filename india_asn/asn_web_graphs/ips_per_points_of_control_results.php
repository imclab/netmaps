<?
/**
 * ips_per_points_of_control_results.php
 *
 * @package default
 */


include "header.php";
?>

<?

include 'country_summary_table.php';

print "<br/>";
?>

<h1>Countries by IPs per Point of Control</h1>

<p>Here we list countries by the average number of IP addresses per point of control, where a point of control is defined as the minimum number of autonomous systems required to connect to 90% of the ip addresses in the country.  This metric is intended as a rough measure of the number of different organizations required to have access to the traffic of the large majority of users within the country.</p>

<?
display_tables("cmp_ips_per_points_of_control", "IPs per point of control", "IPs per point of control", "fewest");
?>
<?
include "footer.php";
?>
