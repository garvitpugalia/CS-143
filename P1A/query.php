<!DOCTYPE html>
<html>
<body>

<h1> Something here </h1>

<form action="query.php" method="GET">
      <textarea name="query" cols="60" rows="8"><?php print "$query" ?></textarea><br />
      <input type="submit" value="Submit" />
</form>

<?php
   $query="ABC";
   echo "Something";
?>

</body>
</html>
