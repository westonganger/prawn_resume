require "prawn_resume"

data = {
  bio: {
    title: "Weston Ganger",
    extra_info: %w(604-309-8713 weston@westonganger.com)
  },

  skills: {
    languages: %w(Elixir Python Ruby Javascript Go Elm C# PHP),
    frameworks: %w(Vue Phoenix Terraform Django Rails Sinatra Flask),
    systems: %w(AWS Docker Ubuntu OSX Windows),
    databases: %w(Postgresql MongoDB Couchbase)
  },

  experience: {
    label: "Experience",
    positions: [
      {
        title: "Director of Engineering  @  Advanced Health Communications",
        duration: "Dec 2016 - present",
        points: [
          "- Led team responsible for design, development and deployment",
          "- Worked with owners to create the company's product roadmap",
          "- Architected and implemented message search and routing algorithms"
        ]
      },
      {
        title: "Lead Software Engineer  @  Scientific Games Corporation",
        duration: "Jan 2013 - Nov 2016",
        points: [
          "- Mentored peers across several products and technologies",
          "- Worked with stakeholders to design and develop productivity tools",
          "- Developed product features and built AWS architecture",
          "- Coordinated tasks between local and remote teams"
        ]
      },
      {
        title: "Software Consultant  @  Iron Ninja Technologies",
        duration: "6 week contract Jun 2016 - Jul 2016",
        points: [
          "- Designed, setup, and deployed all aspects of server architecture",
          "- Led the team creating the product API and underlying model structure",
          "- Built a robust data generation tool for integration testing",
        ]
      },
      {
        title: "Software Engineer  @  Trustwave Holdings",
        duration: "May 2011 - Jan 2013",
        points: [
          "- Integrated Spider Labs security tools into a cohesive product",
          "- Created an automated regression framework",
          "- Trained and led a small team"
        ]
      },
      {
        title: "Software Developer  @  Business Logic Corporation",
        duration: "Jan 2006 - May 2011",
        points: [
          "- Designed and implemented a custom CMS application",
          "- Deployed, tested and maintained several live applications",
          "- Worked with financial experts to implement analytical algorithms",
          "- Mentored and trained new developers"
        ]
      },
      {
        title: "Software Developer  @  Digonex Technologies",
        duration: "Oct 2003 - Dec 2005",
        points: [
          "- Worked with designers to renovate website",
          "- Integrated projects with third party services and programs"
        ]
      }
    ]
  },

  education: {
    name: "University of the Fraser Valley",
    degree: "Bachelor of Computer Information Systems (BCIS)"
  }
}

PrawnResume.to_pdf_file(filename: "test/resume.pdf", data: data, template: :default)
