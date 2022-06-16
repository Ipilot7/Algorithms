bool isLowerCase(int str) {
  return str >= 97 && str <= 122;
}

bool isUpperCase(int str) {
  return str >= 65 && str <= 90;
}

bool isLetter(int str) {
  if (str >= 97 && str <= 122 || str >= 65 && str <= 90) {
    return true;
  }
  return false;
}
