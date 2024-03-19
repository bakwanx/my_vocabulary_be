'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    return queryInterface.bulkInsert(
      'TypeVocabs', 
      [
        {
          type:        "Noun (Kata Benda)",
          description: "Noun atau kata benda digunakan untuk nama orang, benda, hewan, tempat, dan ide atau konsep. Noun sendiri dapat dibagi lagi ke berbagai jenis, seperti countable, uncountable / mass, common, proper, concrete, abstract, dan collective noun.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Pronoun (Kata Ganti)",
          description: "Pronoun adalah kata yang digunakan untuk menggantikan noun. Terdapat 8 jenis pronoun, yaitu personal, demonstrative, interrogative, indefinite, possessive, reciprocal, relative, reflexive, dan intensive pronoun.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Verb (Kata Kerja)",
          description: "Verb adalah kata kerja yang digunakan untuk menunjukkan tindakan atau keadaan. Verb dapat dibagi ke dalam beberapa jenis, seperti action verb dan linking verb.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Adjective (Kata Sifat)",
          description: "Adjective adalah kata sifat yang digunakan untuk memberi keterangan pada noun atau pronoun.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Adverb (Kata Keterangan)",
          description: "Sebagai kata keterangan, fungsi adverb adalah untuk memberikan keterangan tambahan pada verb, adjective, atau adverb itu sendiri. Adverb juga bisa dikelompokkan menjadi beberapa jenis, seperti manner, degree, frequency, place, dan time.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Preposition (Kata Depan)",
          description: "Fungsi preposition adalah untuk menunjukkan hubungan antara noun dan kata-kata lainnya dalam sebuah kalimat.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Conjunction (Kata Hubung)",
          description: "Conjunction digunakan untuk menghubungkan dua kata, frasa, klausa hingga kalimat. Terdapat 3 jenis conjuction, yaitu coordinating, subordinating, dan correlative conjuction.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Interjection (Kata Seru)",
          description: "Jenis kata yang satu ini biasanya digunakan untuk mengungkapkan emosi.",
          createdAt: new Date(),
          updatedAt: new Date()
        },
        {
          type:        "Phrase",
          description: "A phrase is a group of words forming a part of a sentence",
          createdAt: new Date(),
          updatedAt: new Date()
        },
      ]
    );
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
