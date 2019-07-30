module PrawnResume
  module Templates

    class Default < BaseTemplate

      CONTENT_X = 100
      WIDTH = bounds.right
      CONTENT_WIDTH = WIDTH - CONTENT_X
      SECTION_GAP = 22
      
      @@schema = {
        bio: {
          title: "",
          extra_info: []
        },

        skills: {
          languages: [],
          frameworks: [],
          systems: [],
          databases: [],
        },

        experience: {
          label: "",
          positions: [
            {
              title: "",
              duration: "",
              points: []         
            },
          ]
        },

        education: {
          name: "",
          degree: ""
        }
      }


      def render_pdf
        Prawn::Document.generate("resume.pdf") do

          [render_bio, render_skills, render_experience, render_education].each do |data|
            bounding_box([0, cursor], width: WIDTH) do
              render_bio(data[:bio])
            end
          end

          move_down SECTION_GAP
          bounding_box([0, cursor], width: WIDTH) do
            write_skills(data[:skills])
          end

          move_down SECTION_GAP
          bounding_box([0, cursor], width: WIDTH) do
            write_experience(data[:experience])
          end

          move_down SECTION_GAP
          bounding_box([0, cursor], width: WIDTH) do
            write_education(data[:education])
          end

        end
      end

      private

      def render_bio
        h = @data[:bio]

        space = ' ' * 10

        font_size(18) {
          text(h[:title], align: :center)
        }

        font_size(8) {
          text(h[:extra_info].join(space), align: :center)
        }
      end

      def render_skills
        sub_section_gap = 5

        @data[:skills].each_with_index do |(section, values), index|
          font_size(10) {
            text(section.to_s.capitalize)
          }

          top = bounds.top - ((sub_section_gap + font_size) * index)

          bounding_box([CONTENT_X, top], width: CONTENT_WIDTH) do
            font_size(10) {
              text(values.join(", "))
            }
          end

          move_down sub_section_gap
        end
      end

      def render_experience
        h = @data[:experience]

        sub_section_gap = 15

        text(h[:label])

        bounding_box([CONTENT_X, bounds.top], width: CONTENT_WIDTH) do
          title_opts = {style: :bold}
          date_opts = {size: 10, style: :italic}

          h[:positions].each do |pos|
            text(pos[:title], title_opts)

            text(pos[:duration], date_opts)

            pos[:points].each { |point| text(point) }

            move_down sub_section_gap
          end
        end
      end

      def render_education
        h = @data[:education]

        text("Education")

        bounding_box([CONTENT_X, bounds.top], width: CONTENT_WIDTH) do
          text(h[:name], style: :bold)
          text(h[:degree])
        end
      end

    end

  end
end
