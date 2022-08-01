var admin = require("firebase-admin");

var serviceAccount = require("./db/test-coderhousebackend-firebase-adminsdk-wx33t-c508ceeac1.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://url-examle.firebaseio.com",
});

console.log("Base de datos conectada");

CRUD();

async function CRUD() {
  const db = admin.firestore();
  const query = db.collection("usuarios");

  try {
    /* CREATE */
    const usuarioData = {
      nombre: "Juan",
      dni: "1111111",
    };
    let doc = query.doc();
    await doc.create(usuarioData);

    console.log("Usuario creado");
  } catch (error) {
    console.log(error);
  }

  /* READ */
  // query
  //   .get()
  //   .then((snapshot) => {
  //     snapshot.forEach((doc) => {
  //       console.log(doc.id, "=>", doc.data());
  //     });
  //   })
  //   .catch((err) => {
  //     console.log("Error getting documents", err);
  //   });

  /* UPDATE */
  // query
  //   .where("dni", "==", "1111111")
  //   .get()
  //   .then((snapshot) => {
  //     snapshot.forEach((doc) => {
  //       doc.ref.update({ nombre: "Juanito" });
  //     });
  //   })
  //   .catch((err) => {
  //     console.log("Error getting documents", err);
  //   });

  /* DELETE */
  //   query
  //     .where("dni", "==", "1111111")
  //     .get()
  //     .then((snapshot) => {
  //       snapshot.forEach((doc) => {
  //         doc.ref.delete();
  //       });
  //     });
}