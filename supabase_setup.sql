-- Supabase Database Setup for Catan Hero Powers Voting
-- Run this in your Supabase SQL Editor

-- Create the votes table
CREATE TABLE IF NOT EXISTS public.votes (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    power_name TEXT NOT NULL,
    vote_type TEXT NOT NULL CHECK (vote_type IN ('image', 'rules')),
    vote_value INTEGER NOT NULL CHECK (vote_value IN (-1, 1)),
    session_id TEXT NOT NULL
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_votes_power_name ON public.votes(power_name);
CREATE INDEX IF NOT EXISTS idx_votes_session_id ON public.votes(session_id);
CREATE INDEX IF NOT EXISTS idx_votes_created_at ON public.votes(created_at);

-- Enable Row Level Security (RLS)
ALTER TABLE public.votes ENABLE ROW LEVEL SECURITY;

-- Create policies for anonymous users
CREATE POLICY "Allow anonymous users to read votes" ON public.votes
    FOR SELECT TO anon USING (true);

CREATE POLICY "Allow anonymous users to insert votes" ON public.votes
    FOR INSERT TO anon WITH CHECK (true);

-- Optional: Prevent duplicate votes per session (uncomment if you want stricter control)
-- CREATE UNIQUE INDEX idx_unique_session_vote ON public.votes(session_id, power_name, vote_type);

-- Grant necessary permissions
GRANT SELECT, INSERT ON public.votes TO anon;
GRANT USAGE ON SCHEMA public TO anon;

-- Verify the setup
SELECT 'Votes table created successfully' as status;