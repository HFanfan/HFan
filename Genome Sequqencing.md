1. ##### de Bruijn graph of a collection of K-mers:

-Represent every K-mer as an edge between its prefix and suffix

-Glue All nodes with identical labels

It's so strange that the de Bruijn graph you have constructed from the genome composition is the same as the de Bruijn graph constructed from the given genome



2. ##### Euler's Theorem

A graph is balanced if indegree = outdegree for each node



3. ##### Paired de Bruijn graph for a collection of paired K-mers:

-Represent every paired K-mers as an edge between its paired prefix and paired suffix

-Glue ALL nodes with identical labels.

##### So the question here it is:

​	How can you get the paired K-mers while you do not know the order of the genome sequence?

​	Get mutiple identical copies of genome, randomly cut genomes into large equally sized fragments of size **InsertLength**, then generate read-pairs.

​	So a paired K-mer is a pair of K-mers at a fixed distance d apart in Genome.

**Disclaimers:**

​	In reality, Read1  and Read2 are typically sampled from different strands:

​		(➡……⬅ rather than ➡……➡)

​	In reality, the distance d between reads is measured with errors.

And the correct way to represent the paired K-mer composition should be in lexicographic order, like in a dictionary.

**lexicographical order**:It is a sort method to form a sequence of random variables

**Problems**:All the paired-reads can never be generated so successfully...........



4. ##### Brute Force Cyclopeptides Sequencing

The mass of the entire peptide is usually known.

Algorithm:

​	Generate all peptides with given mass

​	Form their theoretical spectra

​	Look for matches with the given spectrum

Disadvantage:

​	There trillions of peptides sharing the same mass.



5. #####  Cyclopeptides Sequencing with Branch and Bound

Find all amino acids whose masses occur in Spectrum. Add to List.

Extend each peptide in List by each of 18 different amino acid masses.

Trim inconsistent peptides from List

Return any peptides in List whose theoretical spectra match Spectrum

Iterate Steps 2-4 until List is empty

Disadvantage:The theoretical Spectra is different from the experimental Spectra because of the errors of the experiment.



6. ##### Leaderboard Cyclopeptides Sequencing

Add "0-peptide" to Leaderboard as LeaderPeptide.

**Extend**  each peptide in LeaderPeptide by each of 18 different amino acid masses.

**Cut** low-scoring peptides from Leaderboard.(Keep "top" N with ties)

Update LeaderPeptide if there is a higher scoring peptide in Leaderboard with mass = parent mass

Eliminate all peptides with mass > parent mass

Iterate 2-5 until LeaderBoard is empty

Return LeaderPeptide



7. ##### From 18 to 100+ Amino Acids

NRPs (Non-ribosomal peptides)  contain some non-standard amino acid because they are free from the Central Dogma.

e.g.			Tyrocidine B: Val-**Orn-**Phe-Pro-Trp-Phe-Asn-Gln-Tyr

​			Ornithine: non-standard amino acid

Bioinformaticians assume any integer between 57-200 can act as the mass of an amino acid.



8. ##### The Spectral Convolution saves the Day

Spectral Convolution: positive difference between every pair of masses in spectrum.

##### Convolution Cyclopeptide Sequencing

Form spectral convolution of spectral

Take the M most frequent elements in the convolution *(between 57 and 200)

Run Leaderboard Cyclopeptide Sequencing forming peptides only on these M integers.