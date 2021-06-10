<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@1,700&display=swap" rel="stylesheet">
  <title>Home</title>
  <style>
    html {
      background-color: #cde7f8;
      font-family: 'Playfair Display', serif;
    }
    div {
      position: absolute;
      top: 30%;
      left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
      font-size: 80px;
    }

    span {
      width: 200px;
    }

    button {
      background-color: transparent;
      border: 1px solid black;
      border-radius: 3px;
      font-size: 50px;
      font-family: 'Playfair Display', serif;
      padding: 4px 25px;
    }

    button:hover {
      border: 2px solid black;
    }
  </style>
</head>

<body>
<div>
  BOARD PROJECT
  <br>
  <span>
    <button onclick="location.href='gongji_list.jsp'">Move to board</button>
  </span>
</div>

</body>

</html>