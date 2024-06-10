#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cstdlib>
#include <ctime>

void genera(const std::string& filename, int num_exercicis) {
    std::ofstream file(filename);

    if (!file.is_open()) {
        std::cerr << "Error, no s'ha pogut obrir el fitxer " << filename << std::endl;
        return;
    }

    // Seed per la generació aleatòria
    std::srand(std::time(0));

    // Generar precursors i predecessors aleatoriament
    std::vector<std::pair<int, int>> precursors;
    std::vector<std::pair<int, int>> predecessors;

    for (int i = 1; i <= num_exercicis; ++i) {
        int precursor = -1;
        int predecessor = -1;
        if (std::rand() % 2) { // 50% probabilitats de tenir precursor
            precursor = std::rand() % num_exercicis + 1;
            if (precursor != i) {
                precursors.push_back({i, precursor});
            }
        }
        if (std::rand() % 2) { // 50% probabilitat de tindre predecesor
            predecessor = std::rand() % num_exercicis + 1;
            if (predecessor != i && predecessor != precursor) {
                predecessors.push_back({i, predecessor});
            }
        }
    }

    // Escriure PDDL del problema
    file << "(define (problem problema1)\n";
    file << "    (:domain domini)\n";
    file << "    (:objects\n";

    for (int i = 1; i <= num_exercicis; ++i) {
        file << "        e" << i << " - exercici\n";
    }
    for (int i = 1; i <= 15; ++i) {
        file << "        d" << i << " - dia\n";
    }
    for (int i = 1; i <= 10; ++i) {
        file << "        n" << i << " - nivell\n";
    }
    file << "    )\n";
    file << "    (:init\n";

    for (int i = 1; i <= 15; ++i) {
        file << "        (= (ordre-dia d" << i << ") " << i << ")\n";
        file << "        (= (exercicis-dia d" << i << ") 0)\n";
    }
    for (int i = 1; i <= 10; ++i) {
        file << "        (= (ordre-nivell n" << i << ") " << i << ")\n";
    }
    for (int i = 1; i <= num_exercicis; ++i) {
        file << "        (= (nivell-actual e" << i << ") 1)\n";
    }

    // Objectius aleatoris
    for (int i = 1; i <= num_exercicis; ++i) {
        int goal = std::rand() % 10;
        file << "        (= (objectiu e" << i << ") " << goal << ")\n";
    }

    for (const auto& precursor : precursors) {
        file << "        (preparador e" << precursor.first << " e" << precursor.second << ")\n";
    }
    for (const auto& predecessor : predecessors) {
        file << "        (predecesor e" << predecessor.first << " e" << predecessor.second << ")\n";
    }

    file << "        (= (dia-actual) 1)\n";
    file << "    )\n";
    file << "    (:goal\n";
    file << "        (forall (?E - exercici)\n";
    file << "            (>= (nivell-actual ?E) (objectiu ?E))\n";
    file << "        )\n";
    file << "    )\n";
    file << ")\n";

    file.close();
}

int main() {
    int num_exercicis;
    std::cout << "Introdueix el nombre d'exercicis: ";
    std::cin >> num_exercicis;

    genera("problema.pddl", num_exercicis);

    std::cout << "Generat a 'problema.pddl'" << std::endl;

    return 0;
}
