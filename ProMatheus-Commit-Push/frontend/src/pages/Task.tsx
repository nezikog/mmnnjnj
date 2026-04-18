import { useEffect, useState } from "react";
import { getTestsBySubjectAndClass, submitAnswers } from "../api";
import { useParams, useNavigate } from "react-router-dom";

interface Test {
    id: number;
    courseId: number;
    questions: string;
    answer: string;
    difficulty: number;
    classId: number;
    subject: string;
}

export default function TestPage() {
    const { subject, classId } = useParams<{ subject: string; classId: string }>();
    const navigate = useNavigate();
    
    const [tests, setTests] = useState<Test[]>([]);
    const [answers, setAnswers] = useState<Record<number, string>>({});
    const [result, setResult] = useState<{ score: number; max: number } | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [subjectName, setSubjectName] = useState<string>("");
    const [className, setClassName] = useState<number | null>(null);

    useEffect(() => {
        if (subject && classId) {
            loadTests();
        }
    }, [subject, classId]);

    async function loadTests() {
        try {
            setLoading(true);
            const data = await getTestsBySubjectAndClass(
                decodeURIComponent(subject!), 
                parseInt(classId!)
            );
            setTests(data);
            
            // Сохраняем название предмета и класс для отображения
            if (data.length > 0) {
                setSubjectName(data[0].subject || subject!);
                setClassName(parseInt(classId!));
            }
        } catch (err) {
            setError(err instanceof Error ? err.message : "Failed to load");
        } finally {
            setLoading(false);
        }
    }

    function handleAnswer(id: number, value: string) {
        setAnswers(prev => ({ ...prev, [id]: value }));
    }

    function normalize(str: string) {
        return (str ?? "").trim().toLowerCase().replace(/\s+/g, "");
    }

    async function submit() {
        let score = 0;
        let max = 0;

        tests.forEach(t => {
            const correct = normalize(t.answer);
            const user = normalize(answers[t.id] || "");
            max += t.difficulty; // используем difficulty как баллы
            if (user === correct) score += t.difficulty;
        });

        setResult({ score, max });
        
        // Отправка на сервер (если нужно сохранить результат)
        try {
            const formattedAnswers = tests.map(t => ({
                testId: t.id,
                userAnswer: answers[t.id] || "",
                isCorrect: normalize(answers[t.id] || "") === normalize(t.answer)
            }));
            await submitAnswers(formattedAnswers);
        } catch (err) {
            console.error("Failed to submit to server:", err);
        }
    }

    function goBack() {
        navigate(-1);
    }

    if (loading) return (
        <div style={styles.container}>
            <div style={styles.loading}>Загрузка тестов...</div>
        </div>
    );
    
    if (error) return (
        <div style={styles.container}>
            <div style={styles.error}>Ошибка: {error}</div>
            <button onClick={goBack} style={styles.backButton}>Назад</button>
        </div>
    );

    return (
        <div style={styles.container}>
            <div style={styles.header}>
                <button onClick={goBack} style={styles.backButton}>← Назад</button>
                <h2 style={styles.title}>
                    Тест по {subjectName} {className && `${className} класс`}
                </h2>
            </div>

            <div style={styles.testsContainer}>
                {tests.map((t, index) => (
                    <div key={t.id} style={styles.testCard}>
                        <div style={styles.questionHeader}>
                            <span style={styles.questionNumber}>Вопрос {index + 1}</span>
                            <span style={styles.points}>{t.difficulty} балл(а)</span>
                        </div>
                        <p style={styles.question}>{t.questions}</p>
                        <input
                            type="text"
                            placeholder="Введите ответ"
                            onChange={(e) => handleAnswer(t.id, e.target.value)}
                            style={styles.input}
                        />
                    </div>
                ))}
            </div>

            <button onClick={submit} style={styles.submitButton}>
                Отправить ответы
            </button>

            {result && (
                <div style={styles.resultContainer}>
                    <h3 style={styles.resultTitle}>Результат:</h3>
                    <div style={styles.resultScore}>
                        {result.score} / {result.max}
                    </div>
                    <div style={styles.resultPercent}>
                        {Math.round((result.score / result.max) * 100)}%
                    </div>
                </div>
            )}
        </div>
    );
}

const styles = {
    container: {
        padding: '20px',
        fontFamily: 'Arial, sans-serif',
        maxWidth: '800px',
        margin: '0 auto',
        backgroundColor: '#f5f5f5',
        minHeight: '100vh'
    },
    header: {
        display: 'flex',
        alignItems: 'center',
        gap: '20px',
        marginBottom: '30px',
        flexWrap: 'wrap' as const
    },
    backButton: {
        padding: '8px 16px',
        backgroundColor: '#6c757d',
        color: 'white',
        border: 'none',
        borderRadius: '4px',
        cursor: 'pointer',
        fontSize: '14px'
    },
    title: {
        margin: 0,
        color: '#333'
    },
    testsContainer: {
        display: 'flex',
        flexDirection: 'column' as const,
        gap: '20px'
    },
    testCard: {
        backgroundColor: 'white',
        padding: '20px',
        borderRadius: '8px',
        boxShadow: '0 2px 4px rgba(0,0,0,0.1)'
    },
    questionHeader: {
        display: 'flex',
        justifyContent: 'space-between',
        marginBottom: '10px',
        paddingBottom: '10px',
        borderBottom: '1px solid #eee'
    },
    questionNumber: {
        fontWeight: 'bold',
        color: '#007bff'
    },
    points: {
        color: '#28a745',
        fontWeight: 'bold'
    },
    question: {
        fontSize: '16px',
        marginBottom: '15px',
        color: '#333'
    },
    input: {
        padding: '10px',
        width: '100%',
        maxWidth: '300px',
        border: '1px solid #ddd',
        borderRadius: '4px',
        fontSize: '14px',
        boxSizing: 'border-box' as const
    },
    submitButton: {
        marginTop: '30px',
        padding: '12px 24px',
        backgroundColor: '#007bff',
        color: 'white',
        border: 'none',
        borderRadius: '4px',
        cursor: 'pointer',
        fontSize: '16px',
        width: '100%'
    },
    loading: {
        textAlign: 'center' as const,
        padding: '40px',
        fontSize: '18px',
        color: '#666'
    },
    error: {
        color: 'red',
        textAlign: 'center' as const,
        padding: '40px'
    },
    resultContainer: {
        marginTop: '30px',
        padding: '20px',
        backgroundColor: '#e8f5e9',
        borderRadius: '8px',
        textAlign: 'center' as const
    },
    resultTitle: {
        margin: '0 0 10px 0',
        color: '#2e7d32'
    },
    resultScore: {
        fontSize: '24px',
        fontWeight: 'bold',
        color: '#2e7d32'
    },
    resultPercent: {
        fontSize: '18px',
        color: '#666',
        marginTop: '5px'
    }
};