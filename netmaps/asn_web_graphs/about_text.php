
<p>
There are over <a href="http://www.internetworldstats.com/stats.htm">1.5 billion</a> users on the Internet, but all of those users connect through only about <a href="http://www.potaroo.net/tools/asn16/">30,000</a> autonomous systems (ASs).  ASs are generally Internet service providers but can also be large companies, universities, and other such organizations who act as independent entities on the Internet.  These ASs are responsible for assigning individual IP addresses and routing traffic from individual machines / IP addresses out to and in from the wider Internet.  So controlling the traffic (filtering, surveilling, blocking, etc) of those 1.5 billion users only requires controlling those 30,000 ASs.  But the vast majority of those ASs are small organizations that rely on one or more larger ASs for access to the wider Internet, so the vast majority of traffic flows through this much smaller slice of less than a thousand large ASs.
</p>
<p>
It is well understood now that governments exert various kinds of control over their local zones of the Internet, including <a href="http://opennet.net">filtering offensive sites</a>,
 <a href="http://eur-lex.europa.eu/LexUriServ/site/en/oj/2006/l_105/l_10520060413en00540063.pdf">surveilling the activities of users</a>,
and <a href="http://arstechnica.com/tech-policy/news/2009/04/korea-fits-itself-for-a-3-strikes-jackboot.ars">controlling which users  can access the Internet at all</a>.  When broken down into individual countries,
the number of ASs that have access to almost all of the traffic within a given country is at most a few dozen ASs and often only a few ASs, even for the biggest countries.  For
example, we have found that in <a href="geo_map_home.php/?cc=CN">China</a> over 90% of the country's approximately 190 million IP addresses ultimately connect to the wider Internet through one of only 4 ASs, while in <a href="geo_map_home.php/?cc=RU">Russia</a> 90% of the country's approximately 20 million IP addresses connect through one of 36 ASs.
</p>


<p>The maps on this site are a rough attempt to map how the ASs in each given country connect to one another and to the rest of the world, with a particular eye for developing metrics for the relative costs of controlling the Internet in each country.  For each country, we provide a visual map of the network of ASs, as well as the following core metrics based on the country AS network data:
</p>
<ul>
<li>Connected IPs: the total number of IP addresses connected to the Internet through this AS, including the IP addresses connected through any children ASs</li>
<li>Points of Control: the minimum set of ASs required to connect to 90% of the IP addresses in each country</li>
<li>IPs per Point of Control: the total number of IP addresses in each country divided by the number of points of control</li>
<li>Complexity: the overall complexity of the network connecting the ASs in each country </li>
</ul>

<p>
To see the map for a given country, click on either of the lists below and then click on the desired country name.  For more information about the methodology used for the metrics and the maps, see the <a href="methods.php">Research</a> page.  For an xml file containing the raw data, including the network connections and the metrics for every country, see the <a href="raw_data.php">Data</a> page.
</p>