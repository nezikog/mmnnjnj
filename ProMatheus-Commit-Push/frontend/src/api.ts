const API = "http://localhost:5000/api/test";

export async function getTestsBySubjectAndClass(subject: string, classId: number) {
    const res = await fetch(`${API}/${encodeURIComponent(subject)}/${classId}`);
    
    if (!res.ok) {
        throw new Error(`API Error: ${res.status}`);
    }
    
    const data = await res.json();
    return data.tests; // возвращаем массив тестов
}

export async function getTestsBySubject(subject: string) {
    const res = await fetch(`${API}/subject/${encodeURIComponent(subject)}`);
    
    if (!res.ok) {
        throw new Error(`API Error: ${res.status}`);
    }
    
    const data = await res.json();
    return data.tests;
}

export async function getTestsByClass(classId: number) {
    const res = await fetch(`${API}/class/${classId}`);
    
    if (!res.ok) {
        throw new Error(`API Error: ${res.status}`);
    }
    
    const data = await res.json();
    return data.tests;
}

export async function getTestById(testId: number) {
    const res = await fetch(`${API}/${testId}`);
    
    if (!res.ok) {
        throw new Error(`API Error: ${res.status}`);
    }
    
    return res.json();
}

export async function submitAnswers(answers: any[]) {
    const res = await fetch(`${API}/submit`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(answers)
    });
    
    if (!res.ok) {
        throw new Error(`Submit Error: ${res.status}`);
    }
    
    return res.json();
}