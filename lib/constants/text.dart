const skip = "Skip";
const errorEntry = "Please enter some text";

const stages = [
  {
    "id": 0,
    "title": "Intuitive note-taking",
    "body":
        "Effortlessly organize your thought and ideas by keeping your important information at your fingertips.",
    "image": "illustration.svg",
    "next_route": "",
  },
  {
    "id": 1,
    "title": "Stay productive note-taking",
    "body":
        "Stay productive on the go by ensuring you never forget anything important or vital.",
    "image": "blog_header.svg",
    "next_route": ""
  },
  {
    "id": 2,
    "title": "Peace of mind",
    "body":
        "Experience peace of mind with our automatic cloud syncing, ensuring your notes are securely backed up ans accessible.",
    "image": "challenges.svg",
    "next_route": ""
  }
];

class Onboard {
  getStages() {
    return stages;
  }
}