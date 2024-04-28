# Piraeus Ships Data Scripts
A set of complex PostGres SQL scripts that grab useful information from [a database](https://datastories.cs.unipi.gr/index.php/s/ZEM86Fe6i4FeJCj) of ship data in Piraeus during the month of August, 2019.

The goal of the project was to improve all the query execution speeds by utilizing indices for each table (`Indices.sql`), as well as partitions (`Partitions.sql`).

This project was a group assignment for the purposes of the DBMS class, University of Piraeus 2023-2024.

Example screenshots of *before*-**after** improvements using a combination of indices + partitions:

<p float="left">
	<img src="https://i.imgur.com/N7gYJl7.png" width="49%" />
	<img src="https://i.imgur.com/JvMzSI2.png" width="49%" />
</p>
<hr>
<p float="left">
	<img src="https://i.imgur.com/6WLzjeH.png" width="49%" />
	<img src="https://i.imgur.com/HFwCwTz.png" width="49%" />
</p>
